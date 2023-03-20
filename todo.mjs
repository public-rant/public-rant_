import { Liquid } from 'liquidjs'
// import { fs } from 'zx/.'

const engine = new Liquid()
const writeFile = (string) => { fs.writeFile(__filename + '.md', string) }
const tpl = engine.parse(String(await fs.readFile(__filename + '.tmpl')))
const collection = await fs.readJSON(__filename + '.json')
engine.render(tpl, { collection: collection }).then(writeFile)
